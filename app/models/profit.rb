class Profit < ApplicationRecord
  belongs_to :ticker
  enum kind: [:Lower, :Higher]  
  scope :lower, -> { (where("kind = ? ", 0)) } # 0 = Lower
  scope :higher, -> { (where("kind = ? ", 1)) } # 1 = Higher

  def self.send_chain(methods)
    methods.inject(self, :send)
  end

end
