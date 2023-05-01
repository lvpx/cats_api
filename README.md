# Cats API

This is a simple REST API for uploading, deleting, fetching, and listing cat images. It's built using Ruby on Rails and supports JSON responses.

## Installation

1. Clone this repository: `git clone https://github.com/your_username/cat_images_api.git`
2. Install dependencies: `cd cat_images_api && bundle install`
3. Set up the database: `rails db:setup`
4. Run the server: `rails server`

## Usage

### Upload a cat image

```json
POST /cats

Headers:
Content-Type: multipart/form-data

Parameters:
name: string (required)
image: file (required)

Response:
HTTP/1.1 201 Created
Content-Type: application/json

{
  "id": 1,
  "name": "Cato",
  "image_url": "http://localhost:3000/cats/1/image"
}
```

### Fetch a cat image

```json
GET /cats/:id/image

Response:
HTTP/1.1 200 OK
Content-Type: image/jpeg
Content-Disposition: inline; filename="cat.jpg"
Content-Length: 150812

<cat image binary data>
```

### Delete a cat image

```json
DELETE /cats/:id

Response:
HTTP/1.1 204 No Content
```

### List all cat images

```json
GET /cats

Response:
HTTP/1.1 200 OK
Content-Type: application/json

[
  {
    "id": 1,
    "name": "Cato",
    "image_url": "http://localhost:3000/cats/1/image"
  },
  {
    "id": 2,
    "name": "Mittens",
    "image_url": "http://localhost:3000/cats/2/image"
  }
]
```

## Testing

To run the tests, run the following command:

```
rspec
```

This will run the RSpec test suite and output the results in the terminal.

## License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT).
