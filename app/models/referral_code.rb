class ReferralCode < ActiveRecord::Base
  attr_accessible :code, :event_id, :redeemed_num, :referee_discount, :referer_discount, :user_id, :is_valid

  belongs_to :user
  has_one :ticket_generated_from, class_name: "Ticket", foreign_key: :giveaway_code_id
  has_one :ticket_applied_to, class_name: "Ticket", foreign_key: :applied_code_id

  def self.generate(ticket)
    new_ref_code = self.new
    chars = ('a'..'z').to_a + ('A'..'Z').to_a
    new_ref_code.code = "#{ticket.user.first_name}#{(0...4).collect{chars[Kernel.rand(chars.length)]}.join}"
    new_ref_code.user_id=ticket.user_id
    new_ref_code.event_id=ticket.event_id
    new_ref_code.referee_discount=ticket.event.referee_discount
    new_ref_code.referer_discount=ticket.event.referer_discount
    new_ref_code.is_valid=true
    new_ref_code.redeemed_num=0
    new_ref_code.save!
    return new_ref_code.code, new_ref_code.id
  end
end
