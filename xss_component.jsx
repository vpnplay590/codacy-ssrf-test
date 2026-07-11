function XSSComponent() {
  return <div dangerouslySetInnerHTML={{__html: '<img src=x onerror=alert(document.cookie)>'}} />;
}
