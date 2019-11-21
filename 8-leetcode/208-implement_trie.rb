class Trie

=begin
    Initialize your data structure here.
=end
    def initialize()
      @data = []
    end

=begin
    Inserts a word into the trie.
    :type word: String
    :rtype: Void
=end
    def insert(word)
      @data << word  
    end

=begin
    Returns if the word is in the trie.
    :type word: String
    :rtype: Boolean
=end
    def search(word)
      @data.include?(word)
    end

=begin
    Returns if there is any word in the trie that starts with the given prefix.
    :type prefix: String
    :rtype: Boolean
=end
    def starts_with(prefix)
      @data.each {|x| return true if x.start_with?(prefix)}
      false
    end

end

# Your Trie object will be instantiated and called as such:
# obj = Trie.new()
# obj.insert(word)
# param_2 = obj.search(word)
# param_3 = obj.starts_with(prefix)

trie = Trie.new();

p trie.insert("apple");
p trie.search("apple");   
#  returns true

p trie.search("app");     
#  returns false

p trie.starts_with("app"); 
#  returns true

p trie.insert("app");   
p trie.search("app");     
#  returns true
