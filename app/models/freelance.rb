class Freelance < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :registerable :timeoutable and :omniauthable
  belongs_to :level
  belongs_to :f_role
  after_save :create_wallet
  devise :database_authenticatable, :recoverable, :registerable,
    :rememberable, :trackable, :validatable
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>", cover: "160x160>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates :gender, :name, :last_name, :f_role_id, presence: true

  def create_wallet
  	id = self.id
  	if !Wallet.find_by_freelance_id(id)
	  	wallet = Wallet.new
	  	wallet.money = 0
	  	wallet.freelance_id = id
		  wallet.save
  	end
  end

end
