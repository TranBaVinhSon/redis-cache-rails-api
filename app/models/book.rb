class Book < ApplicationRecord
  after_save :clear_cache

  def clear_cache
    $redis.del "books"
  end
end
