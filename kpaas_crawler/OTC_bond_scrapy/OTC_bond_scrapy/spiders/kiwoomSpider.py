import scrapy
from scrapy_splash import SplashRequest
from OTC_bond_scrapy.items import OtcBondScrapyItem

lua_script = '''
function main(splash)
    splash:set_viewport_full()  -- 페이지 전체를 렌더링할 수 있게 설정
    splash:go(splash.args.url)
    splash:wait(5)
    
    -- 특정 요소 선택
    local element = splash:select("#contentMain > div > div.tab-container > div.tab-panel > section > div.total-fundnum > span")
    
    -- 요소가 존재하면 텍스트 추출
    if element then
        local element_text = element:text()
        
        -- 텍스트가 비어있지 않으면 추가 대기
        if element_text ~= "" then
            splash:wait(3)
        end
    end  -- if element의 끝

    -- HTML 반환
    return {html=splash:html()}
end
'''


class KiwoomSpider(scrapy.Spider):
    name = "kiwoomSpider"
    allowed_domains = ["www.kiwoom.com"]
    start_urls = ["https://www.kiwoom.com/wm/bnd/od010/bndOdListView"]

    def start_requests(self):
        yield SplashRequest(
            self.start_urls[0],
            self.parse,
            endpoint="execute",
            args={'lua_source': lua_script},
            # args={'wait': 10},
            dont_filter=True,
        )

    def parse(self, response):
        items = OtcBondScrapyItem
        items['trading_company_name'] = ''
        print(response.xpath('//*[@id="contentMain"]/div/div[3]/div[2]/section/div[2]/span/text()').extract_first())