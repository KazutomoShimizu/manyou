|            |          |                       |                         |
| ---------- | -------- | --------------------- | ----------------------- |
| tasks       |          |                       |                         |
| title      | string   | null:false            |                         |
| content    | text     | null:false            |                         |
| created_at | datetime | null: false           | precision: 6            |
| updated_at | datetime | null: false           | precision: 6            |
| end_date   | datetime | null: false           | default: -> { "now()" } |
| status     | integer  | null: false           |                         |
| priority   | integer  | null: false           |                         |
| ["status"] | index    | index_tasks_on_status |                         |
| ["title"]  | index    | index_tasks_on_title  |                         |


|                 |               |                      |               |
| --------------- | ------------- | -------------------- | ------------- |
| users           |               |                      |               |
| name            | string        | null:false           |               |
| email           | string        | null:false           |               |
| password_digest | string        |                      |               |
| admin           | boolean       | null:false           | default:false |
| created_at      | datetime      | null:false           | precision: 6  |
| updated_at      | default:false | null:false           | precision: 6  |
| ["email"]       | index         | index_users_on_email | unique: true  |


|            |          |            |              |
| ---------- | -------- | ---------- | ------------ |
| labels     |          |            |              |
| name       | string   | null:false |              |
| created_at | datetime | null:false | precision: 6 |
| updated_at | datetime | null:false | precision: 6 |


|              |          |                                      |              |
| ------------ | -------- | ------------------------------------ | ------------ |
| labellings   |          |                                      |              |
| "task_id"    | bigint   | null:false                           |              |
| "label_id"   | bigint   | null:false                           |              |
| created_at   | datetime | null:false                           | precision: 6 |
| updated_at   | datetime | null:false                           | precision: 6 |
| ["label_id"] | index    | name: "index_labellings_on_label_id" |              |
| ["task_id"]  | index    | name: "index_labellings_on_task_id"  |              |


| Herokuへのデプロイ手順                                   |
| -------------------------------------------------------- |
| デプロイ用のアプリケーションを用意する                   |
| Herokuに新しいアプリケーションを作成する（heroku create) |
| コミットする                                             |
| Heroku buildpackを追加する                               |
| Herokuにデプロイをする                                   |
