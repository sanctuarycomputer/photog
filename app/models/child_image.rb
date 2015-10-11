class ChildImage < Image
  belongs_to :image
  delegate :album, to: :image
end
