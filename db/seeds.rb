require 'httparty'
require 'nokogiri'


def numberize_price_to_cents(price)
  index_of_second_dollar_sign = price.split('')[1..-1].index('$') + 1
  price = price.split('')[1...index_of_second_dollar_sign].join('')
  price_elems = price.split('.')
  price_elems[0].to_i * 100 + price_elems[1].to_i
end

def llbean_scraper(url, category)
  response = HTTParty.get url
  dom = Nokogiri::HTML(response.body)

  lis = dom.css('li.Thumbnail_product-container')


  lis.map do |li|

    product_name = li.css('a.Thumbnail_product-name').text
    product_price = li.css('span.ProductPrice').text
    product_image_url = li.css('img').attr('src').text.strip

    link = "https://www.llbean.com" + li.css('a').attr('href').text
    # Now we will visit this link to get the description
    product_detail_page = HTTParty.get link
    product_dom = Nokogiri::HTML(product_detail_page.body)
    product_detail = product_dom.css('div.premise-statement p').text

    {
      name: product_name,
      description: product_detail,
      price_in_cents: numberize_price_to_cents(product_price),
      image_url: product_image_url,
      category: category
    }
  end
end

mens_footware_url = "https://www.llbean.com/llb/shop/629?bc=474&csp=f&nav=pg2-629&page=footwear-mens-footwear&sort_field=Num_Of_Orders&start=97&viewCount=96"
men_footwares = llbean_scraper(mens_footware_url, "menfootwear")

womens_footware_url = "https://www.llbean.com/llb/shop/630?page=footwear-womens-footwear&csp=f&bc=474&sort_field=Num_Of_Orders&start=1&viewCount=96"
women_footwears = llbean_scraper(womens_footware_url, "womenfootwear")

womens_shirts_url = "https://www.llbean.com/llb/shop/607?page=womens-shirts&csp=f&bc=12-27&sort_field=Num_Of_Orders&start=1&viewCount=96&nav=ln-27"
women_shirts = llbean_scraper(womens_shirts_url, "womenshirts")

mens_shirts_url = "https://www.llbean.com/llb/shop/589?page=mens-shirts&csp=f&bc=12-26&sort_field=Num_Of_Orders&start=1&viewCount=96&nav=ln-26"
men_shirts = llbean_scraper(mens_shirts_url, "menshirts")

womens_pants_url = "https://www.llbean.com/llb/shop/622?page=womens-pants-and-capris&csp=f&bc=12-27&sort_field=Num_Of_Orders&start=1&viewCount=96&nav=ln-27"
women_pants = llbean_scraper(womens_pants_url, "womenpants")

mens_pants_url = "https://www.llbean.com/llb/shop/590?page=mens-pants&csp=f&bc=12-26&sort_field=Num_Of_Orders&start=1&viewCount=96&nav=ln-26"
men_pants = llbean_scraper(mens_pants_url, "menpants")


camping_gear_url = "https://www.llbean.com/llb/shop/915?page=camping-gear&csp=f&bc=29&sort_field=Relevance&start=1&viewCount=48&nav=ln-29"
camping_gears = llbean_scraper(camping_gear_url, "camping-gear")
# puts camping_gears
# File.write('./data.rb', camping_gears)

Product.destroy_all

Product.create(camping_gears)
Product.create(women_footwears)
Product.create(men_footwares)
Product.create(women_shirts)
Product.create(men_shirts)
Product.create(women_pants)
Product.create(men_pants)
