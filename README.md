# README

## App Details

- **Ruby** 2.2.1p85
- **Rails** 4.2.4

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
  }
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
  }
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
  "id": 1
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
  }
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

#### (PUT/PATCH) /tags/id

##### Params

```json
{
  "id": 2,
  "tag": {
    "name": "coffee"
  }
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
  "id": 2
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
