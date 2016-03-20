# README

## App Details

- **Ruby** 2.2.1p85
- **Rails** 4.2.4

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
    "lon": -81.182116
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
    "lon": -81.182116
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
