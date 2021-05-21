document.addEventListener('turbolinks:load', function() {
  var ruleTypeSelector = document.querySelector('#badge_rule')

  if (ruleTypeSelector) {
    ruleTypeSelector.addEventListener('change', ruleValueSelectorChange)
  }
})

switch (ruleValueSelectorChange) {
  case (this.value == "first_try"): {
    labelShow(".tests", ".categories", ".levels", ".all")
    valueShow(".rule_tests", ".rule_categories", ".rule_levels")
    setName(".rule_tests", ".rule_categories", ".rule_levels")

  } case (this.value == "all_by_category"): {
    labelShow(".categories", ".levels", ".tests", ".all")
    valueShow(".rule_categories", ".rule_tests", ".rule_levels")
    setName(".rule_categories", ".rule_tests", ".rule_levels")

  } case (this.value == "all_by_level"): {
    labelShow(".levels", ".tests", ".categories", ".all")
    valueShow(".rule_levels", ".rule_categories", ".rule_tests")
    setName(".rule_levels", ".rule_categories", ".rule_tests")

  } default: {
    labelShow(".tests", ".categories", ".levels", ".all", e=true)
    valueShow(".rule_levels", ".rule_categories", ".rule_tests", e=true)
    setName(".rule_levels", ".rule_categories", ".rule_tests", e=true)
  }
}

function valueShow(value_0, value_1, value_2, e=false) {
  if (e) {
    document.querySelector(value_0).classList.add("hide")
  } else {
    document.querySelector(value_0).classList.remove("hide") 
  }
  document.querySelector(value_1).classList.add("hide")
  document.querySelector(value_2).classList.add("hide")
}

function setName(value_0, value_1, value_2, e=false) {
  if (e) {
    document.querySelector(value_0).setAttribute("name", "badge[nothing]")
  } else {
    document.querySelector(value_0).setAttribute("name", "badge[rule_value]")
  }
  document.querySelector(value_1).setAttribute("name", "badge[nothing]")
  document.querySelector(value_2).setAttribute("name", "badge[nothing]")

}

function labelShow(value_1, value_2, value_3, value_4, e=false) {
  if (e) {
    document.querySelector(value_1).classList.add("hide")
  } else {
    document.querySelector(value_1).classList.remove("hide") 
  }
  document.querySelector(value_2).classList.add("hide")
  document.querySelector(value_3).classList.add("hide")
  document.querySelector(value_4).classList.add("hide")
}
