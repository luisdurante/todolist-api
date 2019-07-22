class Task < ApplicationRecord
    belongs_to :list
    # title, obrigatorio, unico, max 32
    validates(:title, presence: true, length: { maximum: 32 })
    validates_uniqueness_of :title, :scope => :list_id
    # nao obrigatorio max 256
    validates(:description, presence: false,length: { maximum: 256 })
    # 0..10 default 0
    validates(:priority,presence: false)

    after_initialize :set_defaults, unless: :persisted?
    

  def set_defaults
    if self.priority < 0 || self.priority > 10 || self.priority =''
      self.priority  ||= '0'
    end
    self.description  ||= ''
  end
end
