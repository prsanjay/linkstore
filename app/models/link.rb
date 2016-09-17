class Link < ActiveRecord::Base

  belongs_to :user

  validates :link_name,:url, presence: true
  validates :url, format: { with: /((([A-Za-z]{3,9}:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)/,
    message: "Please enter valid URL" }

  paginates_per 10

  acts_as_taggable

  def self.search(search)
    if search
      where('link_name ilike ? OR url ilike ? OR subject ilike ?', "%#{search}%","%#{search}%","%#{search}%")
    else
      scoped
    end
  end
end
