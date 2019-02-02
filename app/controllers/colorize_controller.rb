class ColorizeController < ApplicationController
  def colorize
    input = {
      image: params.fetch("image_url").strip
    }

    # ================================================================================
    # Your code goes below.
    # ================================================================================

  client = Algorithmia.client(ENV.fetch("ALGORITHMIA_KEY"))
  algo = client.algo("deeplearning/ColorfulImageColorization/1.1.13")
  result = algo.pipe(input).result

    @original_image_url = params.fetch("image_url").strip
    @colorized_image_url = "Replace this string with your answer"

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("colorize_templates/colorize.html.erb")
  end

  def colorize_form
    render("colorize_templates/colorize_form.html.erb")
  end
end
