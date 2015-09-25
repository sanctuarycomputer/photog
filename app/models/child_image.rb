class ChildImage < Image
  self.inheritance_column = :image
  belongs_to :image
end
