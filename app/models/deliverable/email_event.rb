module Deliverable
  class EmailEvent < ApplicationRecord
    belongs_to :email, foreign_key: "deliverable_email_id"
  end
end
