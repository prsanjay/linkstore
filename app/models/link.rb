class Link < ActiveRecord::Base
  validates :link_name,:url, presence: true
  validates :url, format: { with: /((([A-Za-z]{3,9}:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)/,
    message: "Please enter valid url" }
  paginates_per 10

  def self.search(search)
    if search
      where('link_name LIKE ? OR url LIKE ? OR subject LIKE ?', "%#{search}%","%#{search}%","%#{search}%")
    else
      scoped
    end
  end
end
