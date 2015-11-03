class Assert {
  private:

  public:
    Assert() { };
    ~Assert() { };

    static bool GreaterThan(const double expected, const double actual, const string attr_name);
    static bool LessThan(const double expected, const double actual, const string attr_name);
    static bool Equal(const int expected, const int actual, const string attr_name);
    static bool Equal(const double expected, const double actual, const string attr_name);
    static bool Equal(const string expected, const string actual, const string attr_name);
    static bool NotEqual(const int value1, const int value2, const string attr_name);
};

static bool Assert::GreaterThan(const double expected, const double actual, const string attr_name="Value") {
  if (actual > expected) return true;

  PrintFormat("%s (%.0f) should be greater than %.0f.", attr_name, actual, expected);
  return false;
}

static bool Assert::LessThan(const double expected, const double actual, const string attr_name="Value") {
  if (actual < expected) return true;

  PrintFormat("%s (%.0f) should be less than %.0f.", attr_name, actual, expected);
  return false;
}

static bool Assert::Equal(const int expected, const int actual, const string attr_name="Values") {
  if (expected == actual) return true;

  PrintFormat("%s (%u) should be equal to %u.", attr_name, actual, expected);
  return false;
}

static bool Assert::Equal(const double expected, const double actual, const string attr_name="Values") {
  if (MathAbs(expected-actual) < 0.000001) return true;

  PrintFormat("%s should be equal to %f.", attr_name, expected);
  return false;
}

static bool Assert::Equal(const string expected, const string actual, const string attr_name="Values") {
  if (expected == actual) return true;

  PrintFormat("%s should be equal to %s.", attr_name, expected);
  return false;
}

static bool Assert::NotEqual(const int expected, const int actual, const string attr_name="Values") {
  if (expected != actual) return true;

  PrintFormat("%s should not be equal to %f.", attr_name, expected);
  return false;
}