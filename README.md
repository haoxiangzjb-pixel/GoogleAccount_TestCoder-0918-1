# CSS 旋转动画演示

## 文件说明

此项目包含以下文件：

- `rotation-animation.css` - 包含旋转动画的CSS代码
- `demo.html` - 演示旋转动画效果的HTML页面

## CSS 动画功能

`rotation-animation.css` 文件包含以下动画类：

- `.rotating-element` - 2秒一圈的正常旋转
- `.fast-rotate` - 1秒一圈的快速旋转
- `.slow-rotate` - 4秒一圈的慢速旋转

## 如何查看动画效果

要查看动画效果，请启动一个本地HTTP服务器：

```bash
cd /workspace
python3 -m http.server 8000
```

然后在浏览器中访问 `http://localhost:8000/demo.html`

## 动画实现

动画使用CSS `@keyframes` 实现，从 `transform: rotate(0deg)` 旋转到 `transform: rotate(360deg)`，配合 `animation` 属性实现连续旋转效果。