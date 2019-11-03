if (process.env.NODE_ENV !== "production") {
  require("./output/Main").main();
} else {
  require("./output/bundle");
}
