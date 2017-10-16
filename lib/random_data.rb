# #5
module RandomData
# #6
    def self.random_paragraph
        sentences = []
        rand(4..6).times do
            sentences << random_sentence
        end
        
        sentences.join(" ")
    end
    
    # #7
    def self.random_sentence
        strings = []
        rand(3..8).times do
            strings << random_word
        end
        
        sentence = strings.join(" ")
        sentence.capitalize << "."
    end
    
    # #8
    def self.random_word
        letters = ('a'...'z').to_a
        letters.shuffle!
        letters[0, rand(3..8)].join
    end
    
    def self.random_price
        prices = (10...100).to_a
        prices.shuffle!
        prices[0]
    end
    
    def self.random_resolved
        resolved_vals = [true, false]
        resolved_vals.shuffle!
        resolved_vals[0]
    end
    
end