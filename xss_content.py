x = "<img src=x onerror=alert(document.cookie)>"
y = '<img src=x onerror=alert(document.cookie)>'
z = "<script>alert('xss')</script>"
print(x, y, z)
