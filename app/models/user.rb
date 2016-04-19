class User < ActiveRecord::Base
  after_destroy :ensure_that_there_is_at_least_one_admin
  validates :name, presence: true, uniqueness: true
  has_secure_password

  private

  def ensure_that_there_is_at_least_one_admin
    if User.count.zero?
      raise "The last user should not be deleted!"
    end
  end
end
