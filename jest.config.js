module.exports = {
  testEnvironment: 'jsdom',
  setupFilesAfterEnv: ['<rootDir>/setupTest.js'],
  moduleFileExtensions: ['js', 'jsx'],
  testMatch: ['**/*.test.js', '**/*.test.jsx'],
  transform: {
    '\\.[jt]sx?$': 'babel-jest',
  },
  transformIgnorePatterns: [
    '/node_modules/(?!(some-module-to-compile)/)'
  ]
};