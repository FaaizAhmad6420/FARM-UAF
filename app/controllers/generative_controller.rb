class GenerativeController < ApplicationController
  def generate
    @user_input = params[:prompt] # Get the user input from the form

    if @user_input.present?
      api_key = ENV['GENERATIVE_API_KEY']
      begin
        # Instantiate the API client and generate content
        api_client = GenerativeApiClient.new
        raw_response = api_client.generate_content(api_key, @user_input)

        # Parse the response to extract the generated text
        if raw_response.is_a?(Array) && raw_response.first["content"]["parts"]
          @response = raw_response.first["content"]["parts"].map { |part| part["text"] }.join("\n")
        else
          @response = "Unexpected response format."
        end

        @response = process_markdown(@response)

        # Log the response for debugging
        Rails.logger.debug("Parsed Response: #{@response}")
      rescue StandardError => e
        Rails.logger.error("API call failed: #{e.message}")
        @response = "An error occurred while generating content."
      end
    else
      @response = "Please provide input for generation."
    end

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace('ai-response-container', partial: 'home/ai_response', locals: { response: @response }) }
      format.html { render 'home/index' } # Or any fallback HTML action you want
    end
  end

  private

  def process_markdown(content)
    renderer = Redcarpet::Render::HTML.new
    markdown = Redcarpet::Markdown.new(renderer, extensions = {})
    markdown.render(content)
  end
end
