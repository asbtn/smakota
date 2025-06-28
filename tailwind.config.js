module.exports = {
  content: [
    "./app/views/**/*.rb",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",

  ],
  theme: {
    extend: {},
  },
  plugins: [
    require('@tailwindcss/forms'),
  ],
};
