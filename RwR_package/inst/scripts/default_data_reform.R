library(tidyverse)

default <- read_csv(
  "../extdata/DefaultDKTotal.csv",
  col_types = 
    cols(
  GivenCVR = col_character(),
  GivenStart = col_date(format = ""),
  GivenEnd = col_date(format = ""),
  Equity = col_double(),
  InformationOnTypeOfSubmittedReport = col_character(),
  NameOfReportingEntity = col_character(),
  NameOfSubmittingEnterprise = col_character(),
  ProfitLoss = col_double(),
  ClassOfReportingEntity = col_character(),
  Assets = col_double(),
  LiabilitiesAndEquity = col_double(),
  RetainedEarnings = col_double(),
  TypeOfAuditorAssistance = col_character(),
  LiabilitiesOtherThanProvisions = col_double(),
  ContributedCapital = col_double(),
  CurrentAssets = col_double(),
  ShorttermLiabilitiesOtherThanProvisions = col_double(),
  AddressOfReportingEntityPostCodeIdentifier = col_character(),
  OtherShorttermPayables = col_double(),
  ShorttermReceivables = col_double(),
  CashAndCashEquivalents = col_double(),
  DateOfApprovalOfAnnualReport = col_date(format = ""),
  DateOfGeneralMeeting = col_date(format = ""),
  ProfitLossFromOrdinaryActivitiesBeforeTax = col_double(),
  NoncurrentAssets = col_double(),
  NameAndSurnameOfAuditor = col_character(),
  DescriptionOfAuditor = col_character(),
  OtherFinanceIncome = col_double(),
  IdentificationNumberCvrOfSubmittingEnterprise = col_double(),
  OtherFinanceExpenses = col_double(),
  ShorttermTradePayables = col_double(),
  OtherShorttermReceivables = col_double(),
  GrossProfitLoss = col_double(),
  LongtermInvestmentsAndReceivables = col_double(),
  TaxExpense = col_double(),
  IdentificationNumberCvrOfAuditFirm = col_double(),
  PropertyPlantAndEquipment = col_double(),
  EmployeeBenefitsExpense = col_double(),
  ShorttermTaxPayables = col_double(),
  DepreciationAmortisationExpenseAndImpairmentLossesOfPropertyPlantAndEquipmentAndIntangibleAssets = col_double(),
  ShorttermTradeReceivables = col_double(),
  DisclosureOfMortgagesAndCollaterals = col_character(),
  NameOfFinancialInstitution = col_character(),
  ProposedDividendRecognisedInEquity = col_double(),
  FixturesFittingsToolsAndEquipment = col_double(),
  ShorttermPayablesToGroupEnterprises = col_double(),
  ShorttermReceivablesFromGroupEnterprises = col_double(),
  Provisions = col_double(),
  GrossResult = col_double(),
  DeferredIncomeAssets = col_double(),
  LongtermLiabilitiesOtherThanProvisions = col_double(),
  NameOfAuditFirm = col_character(),
  NameAndSurnameOfChairmanOfGeneralMeeting = col_character(),
  NameAndSurnameOfMemberOfExecutiveBoard = col_character(),
  same_person = col_double(),
  Year = col_double(),
  Underbranche = col_character(),
  EconActivity = col_double(),
  Konkurrence_density = col_double(),
  Soliditetsgrad = col_double(),
  Likviditetsgrad = col_double(),
  Gearing = col_double(),
  Afkastningsgrad = col_double(),
  lag_end = col_double(),
  Revisorskift = col_double(),
  Direktionsskift = col_double(),
  Soliditetsudvikling = col_double(),
  Afkastningsgradsudvikling = col_double(),
  Gearingsudvikling = col_double(),
  Likviditetsgradsudvikling = col_double(),
  default = col_factor(levels = c("0", "1")),
  Normal_slut = col_date(format = ""),
  Normal_start = col_date(format = ""),
  Type = col_character(),
  CompanyAge = col_double(),
  ExecutiveAge = col_double()
  )
)

default <- select(default, c(
    GivenStart,
    GivenEnd,
#   DateOfApprovalOfAnnualReport,
    default,
    Equity,
    ProfitLoss,
    Assets,
#    Soliditetsgrad,
#    Likviditetsgrad,
    Gearing,
    Afkastningsgrad,
    GivenCVR,
    Normal_start,
    Normal_slut, 
    Underbranche,
    EconActivity,
    Konkurrence_density
  )
) |> rename(
  fiscal_start = GivenStart,
  fiscal_end = GivenEnd,
#  approval_date = DateOfApprovalOfAnnualReport,
  equity = Equity,
  profit = ProfitLoss,
  assets = Assets,
#  solvency_ratio = Soliditetsgrad,
#  liquidity_ratio = Likviditetsgrad,
#  gearing = Gearing,
  return_on_assets = Afkastningsgrad,
  CVR = GivenCVR,
  start = Normal_start,
  end = Normal_slut,
  industry_type = Underbranche,
  econ_activity = EconActivity,
  competition_density = Konkurrence_density
)

save(default, file = "../../data/default.RData")
# prompt(default)

# Checks

# Solvency ratio:

ggplot(default, aes(solvency_ratio, equity / assets)) + 
  geom_point() +
  xlim(-10, 10) +
  ylim(-10, 10)


ggplot(default, aes(return_on_assets, profit / assets)) + 
  geom_point() +
  xlim(-10, 10) +
  ylim(-10, 10)


ggplot(default, aes(gearing, (assets - equity) / equity)) + 
  geom_point() +
  xlim(-10, 10) +
  ylim(-10, 10)



ggplot(default, aes(equity / assets)) + 
  geom_histogram() +
  xlim(-10, 10)
