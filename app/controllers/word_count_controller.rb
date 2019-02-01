class WordCountController < ApplicationController
  def word_count
    @text = params.fetch("user_text")
    @special_word = params.fetch("user_word")

    # ================================================================================
    # Your code goes below.
    # The text the user input is in the string @text.
    # The special word the user input is in the string @special_word.
    # ================================================================================

  tl_text=@text.strip
  clean_text=tl_text.gsub(/[^a-z0-9\s]/i, "") 

    @word_count = @text.split.count

    @character_count_with_spaces = @text.length

    @character_count_without_spaces = clean_text.gsub(/\s+/, "").length

    @occurrences = clean_text.split.count(@special_word)

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("word_count_templates/word_count.html.erb")
  end

  def word_count_form
    render("word_count_templates/word_count_form.html.erb")
  end
end
