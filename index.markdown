---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: home
---
<head>
    <link rel="stylesheet" href="css/styles-code.css">
    <link href="https://fonts.googleapis.com/css2?family=Ubuntu:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet">
</head>

<h1>This is a test</h1>

```javascript
function sayHello(name) {
  if (!name) {
    console.log('Hello World');
  } else {
    console.log(`Hello ${name}`);
  }  
}  
```

```python
def Hello(x):
    x = 2 * x
    print("Two times x equals", x)
```

```r
x <- paste0("testing", "testing")
print(x)
```

<div style="font-family: Ubuntu; font-weight: 400">Testing</div>