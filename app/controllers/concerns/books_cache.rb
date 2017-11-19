require 'json'
module BooksCache
  def fetch_books
    books = $redis.get("books")
    if books.nil?
      books = Book.all.to_json
      $redis.set("books", books)
      $redis.expire("books", 5.hour.to_i)
    end
    @books = JSON.load books
  end
end
