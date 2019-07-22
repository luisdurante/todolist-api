class List < ApplicationRecord
    has_many :tasks
    accepts_nested_attributes_for :tasks

    # Obrigatorio, unico, max 32 characters
    validates(:name, presence: true, length: { maximum: 32 }, uniqueness: true)
    # due_date tem que ser depois da data atual
    validates(:due_date, presence:true, uniqueness:true)
    validate(:due_date_validation)

    private


        def due_date_validation
            if due_date.present? && due_date < Date.today
                @errors = ActiveModel::Errors.new(self)
                @errors.add(:due_date, "Não pode ser antes da data atual")
            end
        end
        
end
