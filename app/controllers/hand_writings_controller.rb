class HandWritingsController < ApplicationController
  def index
  end

  def upload_image
    Rails.logger.debug params.inspect
    @data = "Hello World"
    image_url = params["hand_writing"]["filepicker_url"]
    text_recognition_url = "https://westcentralus.api.cognitive.microsoft.com/vision/v2.0/recognizeText?mode=Handwritten"
    body = {"url": image_url}
    Rails.logger.debug @data.inspect
    Rails.logger.debug "IMAGE URL "+image_url.inspect
    header = {"Ocp-Apim-Subscription-Key": "d6f31213c63544b69af9cf604234d151", "Content-Type": "application/json"}
    response = RestClient.post(text_recognition_url, body.to_json, header)
    callback_url = response.headers[:operation_location]
    sleep 3
    Rails.logger.debug callback_url.inspect
    actual_response = RestClient.get(callback_url, header)
    Rails.logger.debug actual_response.inspect
    hash = Hash.from_xml(actual_response.body)
    lines = hash["OperationSucceededResponse"]["recognitionResult"]["lines"]["Line"]
    text_data = ""
    lines.each do |line|
      text_data  += line["text"] + "\n"
    end
    @response_data = text_data
    render show_image_data_hand_writings_path
  end

  def show_image_data

  end
end
