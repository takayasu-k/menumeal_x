Database Settings

Shops

|      name       |  type  |  option  |
|:---------------:|:------:|:--------:|
|      name       | string | NOT_NULL |
|     address     | string | NOT_NULL |
|       tel       | string |          |
| profile_picture | string |          |

has_one :staff  
has_one :shop_detail  
has_many :shop_pictures  
has_many :menus

<br>
Staffs (deviseを使用)

|   name   |  type  |      option      |
|:--------:|:------:|:----------------:|
| shop_id  |  int   |   FOREIGN KEY    |
|  email   | string | NOT_NULL, UNIQUE |
| password | string |     NOT_NULL     |

belongs_to :shop

<br>
Shop_details

|      name       |  type  |   option    |
|:---------------:|:------:|:-----------:|
|     shop_id     |  int   | FOREIGN KEY |
|     access      | string |             |
|     parking     | string |             |
| operating_hours | string |             |
|     holiday     | string |             |
|     budget      | string |             |
|     payment     | string |             |
|      seats      |  int   |             |
|  private_room   | string |             |
|     smoking     | string |             |
|       bar       | string |             |

belongs_to :shop

<br>
Shop_pictures

|  name   |  type  |       option        |
|:-------:|:------:|:-------------------:|
| shop_id |  int   |     FOREIGN KEY     |
| picture | string |      NOT_NULL       |
|  type   |  int   | NOT_NULL, default:0 |
| user_id |  int   |     FOREIGN KEY     |

belongs_to :shop  
belongs_to :user

<br>
Menus

|     name     |  type  |       option        |
|:------------:|:------:|:-------------------:|
|   shop_id    |  int   |     FOREIGN KEY     |
|     name     | string |      NOT_NULL       |
|    price     |  int   |      NOT_NULL       |
|    status    |  int   | NOT_NULL, default:0 |
|     type     |  int   |      NOT_NULL       |
| desire_count |  int   | NOT_NULL, default:0 |
| eaten_count  |  int   | NOT_NULL, default:0 |

belongs_to :shop  
has_many :reviews  
has_many :desired_menus  
has_many :eaten_menus



<br>
Reviews

|    name     |  type  |       option        |
|:-----------:|:------:|:-------------------:|
|   content   | string |      NOT_NULL       |
|   picture   | string |      NOT_NULL       |
|   user_id   |  int   |     FOREIGN KEY     |
|   menu_id   |  int   |     FOREIGN KEY     |
| likes_count |  int   | NOT_NULL, default:0 |

belongs_to :user  
belongs_to :menu  
has_many :likes  
has_many :comments

<br>
Likes

|   name    | type |   option    |
|:---------:|:----:|:-----------:|
|  user_id  | int  | FOREIGN KEY |
| review_id | int  | FOREIGN KEY |

belongs_to :review, counter_cache: :likes_count  
belongs_to :user

<br>
Comments

|   name    |  type  |   option    |
|:---------:|:------:|:-----------:|
| review_id |  int   | FOREIGN KEY |
|  user_id  |  int   | FOREIGN KEY |
|  content  | string |  NOT_NULL   |

belongs_to :review  
belongs_to :user

<br>
Users (deviseを使用)

|   name   |  type  |      option      |
|:--------:|:------:|:----------------:|
|   name   | string |     NOT_NULL     |
|  email   | string | NOT_NULL, UNIQUE |
| password | string |     NOT_NULL     |
| picture  | string |                  |

has_one :user_profile  
has_many :reviews  
has_many :desired_menus  
has_many :eaten_menus  
has_many :active_relationships,  class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy  
 has_many :passive_relationships, class_name:  "Relationship",
                                  foreign_key: "followed_id",
                                  dependent:   :destroy  
 has_many :following, through: :active_relationships,  source: :followed  
 has_many :followers, through: :passive_relationships, source: :follower

<br>
Desired_menus

|  name   | type |   option    |
|:-------:|:----:|:-----------:|
| menu_id | int  | FOREIGN KEY |
| user_id | int  | FOREIGN KEY |

belongs_to :user  
belongs_to :menu, counter_cache: :desire_count

<br>
Eaten_menus

|  name   | type |   option    |
|:-------:|:----:|:-----------:|
| menu_id | int  | FOREIGN KEY |
| user_id | int  | FOREIGN KEY |

belongs_to :user  
belongs_to :menu, counter_cache: :eaten_count

<br>
User_profiles

|   name   |  type  |       option        |
|:--------:|:------:|:-------------------:|
| user_id  |  int   |     FOREIGN KEY     |
| profile  | string |                     |
| birthday |  date  |                     |
|  gender  |  int   | NOT_NULL, default:0 |

belongs_to :user

<br>
Relationships

|    name     | type |   option    |
|:-----------:|:----:|:-----------:|
| follower_id | int  | FOREIGN KEY |
| followed_id | int  | FOREIGN KEY |

belongs_to :follower, class_name: "User"  
belongs_to :followed, class_name: "User"



<br>
Admin_users

|   name    |  type  |       option        |
|:---------:|:------:|:-------------------:|
|   email   | string |  NOT_NULL, UNIQUE   |
| password  | string |      NOT_NULL       |
|   name    | string |      NOT_NULL       |
| authority |  int   | NOT_NULL, default:0 |
