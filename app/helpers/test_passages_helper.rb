module TestPassagesHelper
  RESULT = { failed: { style: :notice_red, message: "You didn't pass the test" }, passed: { style: :notice, message: 'Test was successfully passed' } }.freeze

  def result(is_passed)
    is_passed ? RESULT[:passed] : RESULT[:failed]
  end
end
