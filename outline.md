Item migration
    t.string :title
    t.integer :inventory
    t.float :price
    t.integer :category_id

Item Model
    belongs_to :category
    has_many :line_items

----

Category migration
    t.string :title

Category model
    has_many :items

----

Line_item migration
    t.integer :cart_id
    t.interger :item_id
    t.integer :quantity     default: 1

Line_item model
    belongs_to :cart
    belongs_to :item
    
----

User migration
    t.integer :current_cart
    devise setup

User model
    has_many :carts
    belongs_to :current_cart, class_name: 'Cart'

----

Cart migration
    t.integer :user_id
    t.string :status    default: "pending"

Cart model
    belongs_to :user
    has_many :line_items
    has_many :items, through: :line_items

