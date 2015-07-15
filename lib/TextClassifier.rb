require_relative 'TrainingExamples.rb'

class TextClassifier
  def initialize(path, training_examples_path = 'training/')
    @examples = TrainingExamples.new(training_examples_path)
    @text = File.read(path)
  end


  def classify()
    words = @text.split(/\W+/)
    words = words.slice(0,100) # Use only the first 100 words for classification

    pIsInteristing = calculateProbabilities(words, "I")
    pIsNotInteristing = calculateProbabilities(words, "!I")

     if pIsInteristing > pIsNotInteristing
       puts "Interisting"
     else
       puts "Not interisting"
     end
  end

  private
    def calculateProbabilities(list_of_words, klass)
      p = @examples.p_apriori(klass)
      list_of_words.each do |word|
        p *= @examples.p(word,klass)
      end
      return p
    end
end