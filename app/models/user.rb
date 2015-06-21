# ## Schema Information
#
# Table name: `users`
#
# ### Columns
#
# Name              | Type               | Attributes
# ----------------- | ------------------ | ---------------------------
# **`id`**          | `integer`          | `not null, primary key`
# **`uid`**         | `integer`          | `not null`
# **`nickname`**    | `string`           |
# **`email`**       | `string`           |
# **`name`**        | `string`           |
# **`image`**       | `string`           |
# **`token`**       | `string`           | `not null`
# **`created_at`**  | `datetime`         | `not null`
# **`updated_at`**  | `datetime`         | `not null`
#
# ### Indexes
#
# * `index_users_on_uid`:
#     * **`uid`**
#

class User < ActiveRecord::Base
  validates :uid,   presence: true
  validates :token, presence: true
end
