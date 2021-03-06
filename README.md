# README

## App Details

- **Ruby** 2.2.1p85
- **Rails** 4.2.4

## Rake

`rake hidden_gems:populate`

Pulls the data from `./places.json`, creates and updates all places records by name,
and creates any new tag records. Not crazy fast, but it works.

## Tests

Run `rspec spec` in the root of the project directory to run all unit tests. **Pull requests will not be accepted unless all tests pass.**

## Authorization

All `GET` endpoints are free and open for use, however any destructive action requires a secret key that will be added as a parameter to your request like so.

```json
{
  "foobar": {
    "foo": "foo",
    "bar": "bar"
  },
  "secret": "SECRET_KEY"
}
```

## Endpoints

- `/places` ( GET, POST, PUT, PATCH, DELETE )
- `/places/tag` ( POST )
- `/places/by_tag` ( GET )
- `/places/by_tag_names` ( GET )
- `/tags` ( GET, POST, PUT, PATCH, DELETE )

### Places

#### (GET) /places

##### Returns

```json
{
  "places": [
    {
      "id": 1,
      "name": "Coffeehaus",
      "description": "small, casual, and simple coffee shop",
      "lat": 28.6585257,
      "lon": -81.182116,
      "street": "1016 Lockwood Blvd",
      "city": "Oviedo",
      "state": "FL",
      "zip": "32765",
      "tags": [
        {
          "id": 1,
          "name": "coffee"
        }
      ]
    }
  ]
}
```

#### (POST) /places/tag

##### Params

```json
{
  "id": 1,
  "tag_id": 2,
  "secret": "SECRET_KEY"
}
```

##### Returns

```json
{
  "places": [
    {
      "id": 1,
      "name": "Coffeehaus",
      "description": "small, casual, and simple coffee shop",
      "lat": 28.6585257,
      "lon": -81.182116,
      "street": "1016 Lockwood Blvd",
      "city": "Oviedo",
      "state": "FL",
      "zip": "32765",
      "tags": [
        {
          "id": 1,
          "name": "coffee"
        },
        {
          "id": 2,
          "name": "breakfast"
        }
      ]
    }
  ]
}
```

#### (GET) /places/by_tags/1,2

##### Returns

```json
{
  "places": [
    {
      "id": 1,
      "name": "Coffeehaus",
      "description": "small, casual, and simple coffee shop",
      "lat": 28.6585257,
      "lon": -81.182116,
      "street": "1016 Lockwood Blvd",
      "city": "Oviedo",
      "state": "FL",
      "zip": "32765",
      "tags": [
        {
          "id": 1,
          "name": "coffee"
        },
        {
          "id": 2,
          "name": "breakfast"
        }
      ]
    }
  ]
}
```

#### (GET) /places/by_tag_names/coffee,breakfast

##### Returns

```json
{
  "places": [
    {
      "id": 1,
      "name": "Coffeehaus",
      "description": "small, casual, and simple coffee shop",
      "lat": 28.6585257,
      "lon": -81.182116,
      "street": "1016 Lockwood Blvd",
      "city": "Oviedo",
      "state": "FL",
      "zip": "32765",
      "tags": [
        {
          "id": 1,
          "name": "coffee"
        },
        {
          "id": 2,
          "name": "breakfast"
        }
      ]
    }
  ]
}
```

#### (GET) /places/id

##### Returns

```json
{
  "place": {
    "id": 1,
    "name": "Coffeehaus",
    "description": "small, casual, and simple coffee shop",
    "lat": 28.6585257,
    "lon": -81.182116,
    "street": "1016 Lockwood Blvd",
    "city": "Oviedo",
    "state": "FL",
    "zip": "32765",
    "tags": [
      {
        "id": 1,
        "name": "coffee"
      }
    ]
  }
}
```

#### (POST) /places

##### Params

```json
{
  "place": {
    "name": "Coffeehaus",
    "description": "small, casual, and simple coffee shop",
    "lat": 28.6585257,
    "lon": -81.182116,
    "street": "1016 Lockwood Blvd",
    "city": "Oviedo",
    "state": "FL",
    "zip": "32765",
  },
  "secret": "SECRET_KEY"
}
```

##### Returns

```json
{
  "place": {
    "id": 1,
    "name": "Coffeehaus",
    "description": "small, casual, and simple coffee shop",
    "lat": 28.6585257,
    "lon": -81.182116,
    "street": "1016 Lockwood Blvd",
    "city": "Oviedo",
    "state": "FL",
    "zip": "32765",
    "tags": [
      {
        "id": 1,
        "name": "coffee"
      }
    ]
  }
}
```

#### (PUT/PATCH) /places/id

##### Params

```json
{
  "id": 1,
  "place": {
    "name": "Coffeehaus",
    "description": "small, casual, and simple coffee shop",
    "lat": 28.6585257,
    "lon": -81.182116,
    "street": "1016 Lockwood Blvd",
    "city": "Oviedo",
    "state": "FL",
    "zip": "32765"
  },
  "secret": "SECRET_KEY"
}
```

##### Returns

```json
{
  "place": {
    "id": 1,
    "name": "Coffeehaus",
    "description": "small, casual, and simple coffee shop",
    "lat": 28.6585257,
    "lon": -81.182116,
    "street": "1016 Lockwood Blvd",
    "city": "Oviedo",
    "state": "FL",
    "zip": "32765",
    "tags": [
      {
        "id": 1,
        "name": "coffee"
      }
    ]
  }
}
```

#### (DESTROY) /places

##### Params

```json
{
  "id": 1,
  "secret": "SECRET_KEY"
}
```

##### Returns

```json
{
  "place": {
    "id": 1,
    "name": "Coffeehaus",
    "description": "small, casual, and simple coffee shop",
    "lat": 28.6585257,
    "lon": -81.182116,
    "street": "1016 Lockwood Blvd",
    "city": "Oviedo",
    "state": "FL",
    "zip": "32765",
    "tags": [
      {
        "id": 1,
        "name": "coffee"
      }
    ]
  }
}
```

### Tags

#### (GET) /tags

##### Returns

```json
{
  "tags": [
    {
      "id": 1,
      "name": "coffee"
    },
    {
      "id": 2,
      "name": "breakfast"
    }
  ]
}
```

#### (GET) /tags/id

##### Returns

```json
{
  "tags": [
    {
      "id": 1,
      "name": "coffee"
    }
  ]
}
```

#### (POST) /tags

##### Params

```json
{
  "tag": {
    "name": "coffee"
  },
  "secret": "SECRET_KEY"
}
```

##### Returns

```json
{
  "tag": {
    "id": 2,
    "name": "coffee"
  },
  "secret": "SECRET_KEY"
}
```

#### (PUT/PATCH) /tags/id

##### Params

```json
{
  "id": 2,
  "tag": {
    "name": "coffee"
  },
  "secret": "SECRET_KEY"
}
```

##### Returns

```json
{
  "tag": {
    "id": 2,
    "name": "coffee"
  }
}
```

#### (DESTROY) /tags/id

##### Params

```json
{
  "id": 2,
  "secret": "SECRET_KEY"
}
```

##### Returns

```json
{
  "tag": {
    "id": 2,
    "name": "coffee"
  }
}
```
