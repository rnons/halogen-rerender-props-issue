## The problem

[Demo](https://rnons.github.io/halogen-rerender-props-issue/#Hello)

1. On initial render, the view is
  ```html
  <div class="text-base font-bold">
    <a>hello</a>
    <button>toggle</button>
  </div>
  ```
2. Click on the toggle button, the `<a>` element becomes
  ```html
  <a href="https://github.com" title="hello">hello</a>
  ```
3. Click on the toggle button again, the `<a>` element becomes
  ```html
  <a href="">hello</a>
  ```

What I really want is `<a>hello</a>`

## Development

```
yarn
spago build -w
parcel index.html
```
