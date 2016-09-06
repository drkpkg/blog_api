require 'nokogiri'
require 'open-uri'

class ContentController < ApplicationController

  ##
  # List all the page contents in the database
  #
  # /api/v1/url/list_all
  #
  # No arguments needed
  #
  # TYPE: GET

  def list_all
    lists = ContentPage.select('id,url,content').all
    status = 200
    render json: {lists: lists}, status: status
  end

  ##
  # Show the content from specific url
  #
  # /api/v1/content/{url}
  #
  # Arguments: url
  #
  # Type: GET

  def get_content
    content = ContentPage.find_by(url: params[:url])
    if !content.nil?
      status = 200
    else
      content = []
      status = 400
    end
    render json: {content: content}, status: status
  end

  ##
  # Show the content from specific url
  #
  # /api/v1/content/create
  #
  # Arguments: url
  #
  # Type: POST

  def create
    content_page = ContentPage.new
    content_page.url = params[:url]
    content_page.content = parse_page(params[:url])
    if content_page.save
      status = 200
    else
      status = 400
    end
    render json: {status: status}
  end

  private

  ##
  # Parse and load the url and send it an Array
  #
  # Arguments: url
  #
  # Type: Method

  def parse_page(url)
    #Simple solution
    doc = Nokogiri::HTML(open(url))
    content = Array.new
    doc.css('h1').each do |position|
      content.push({tag:'h1',text:position.text})
    end
    doc.css('h2').each do |position|
      content.push({tag:'h2',text:position.text})
    end
    doc.css('h3').each do |position|
      content.push({tag:'h3',text:position.text})
    end
    doc.css('a').each do |position|
      content.push({tag:'link',text:position.text, link: position['href']})
    end
    return content
  end
end
