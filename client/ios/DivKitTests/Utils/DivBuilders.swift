@testable import DivKit

import Foundation

func divData(
  logId: String = DivKitTests.cardId.rawValue,
  states: [DivData.State]
) -> DivData {
  DivData(
    logId: logId,
    states: states,
    timers: nil,
    transitionAnimationSelector: nil,
    variableTriggers: nil,
    variables: nil
  )
}

func divData(_ div: Div) -> DivData {
  divData(
    states: [.init(div: div, stateId: 0)]
  )
}

func divImage(
  height: DivSize? = nil,
  imageUrl: String,
  width: DivSize? = nil
) -> Div {
  .divImage(DivImage(
    height: height,
    imageUrl: .value(url(imageUrl)),
    width: width
  ))
}

func divText(
  accessibility: DivAccessibility? = nil,
  actions: [DivAction]? = nil,
  fontSize: Int? = nil,
  fontWeight: DivFontWeight? = nil,
  id: String? = nil,
  text: String,
  width: DivSize? = nil
) -> Div {
  .divText(DivText(
    accessibility: accessibility,
    actions: actions,
    fontSize: fontSize.map { .value($0) },
    fontWeight: fontWeight.map { .value($0) },
    id: id,
    text: .value(text),
    width: width
  ))
}

func divSeparator(
  accessibility: DivAccessibility? = nil,
  delimiterStyle: DivSeparator.DelimiterStyle? = nil,
  id: String? = nil,
  transitionIn: DivAppearanceTransition? = nil,
  transitionTriggers: [DivTransitionTrigger]? = nil,
  visibility: Expression<DivVisibility>? = nil
) -> Div {
  .divSeparator(DivSeparator(
    accessibility: accessibility,
    delimiterStyle: delimiterStyle,
    id: id,
    transitionIn: transitionIn,
    transitionTriggers: transitionTriggers,
    visibility: visibility
  ))
}

func divContainer(
  accessibility: DivAccessibility? = nil,
  actions: [DivAction]? = nil,
  height: DivSize? = nil,
  items: [Div] = [],
  width: DivSize? = nil
) -> Div {
  .divContainer(DivContainer(
    accessibility: accessibility,
    action: nil,
    actionAnimation: nil,
    actions: actions,
    alignmentHorizontal: nil,
    alignmentVertical: nil,
    alpha: nil,
    aspect: nil,
    background: nil,
    border: nil,
    clipToBounds: nil,
    columnSpan: nil,
    contentAlignmentHorizontal: nil,
    contentAlignmentVertical: nil,
    disappearActions: nil,
    doubletapActions: nil,
    extensions: nil,
    focus: nil,
    height: height,
    id: nil,
    itemBuilder: nil,
    items: items,
    layoutMode: nil,
    lineSeparator: nil,
    longtapActions: nil,
    margins: nil,
    orientation: nil,
    paddings: nil,
    rowSpan: nil,
    selectedActions: nil,
    separator: nil,
    tooltips: nil,
    transform: nil,
    transitionChange: nil,
    transitionIn: nil,
    transitionOut: nil,
    transitionTriggers: nil,
    visibility: nil,
    visibilityAction: nil,
    visibilityActions: nil,
    width: width
  ))
}

func divGallery(
  items: [Div]
) -> Div {
  .divGallery(DivGallery(
    accessibility: nil,
    alignmentHorizontal: nil,
    alignmentVertical: nil,
    alpha: nil,
    background: nil,
    border: nil,
    columnCount: nil,
    columnSpan: nil,
    crossContentAlignment: nil,
    crossSpacing: nil,
    defaultItem: nil,
    disappearActions: nil,
    extensions: nil,
    focus: nil,
    height: nil,
    id: nil,
    itemSpacing: nil,
    items: items,
    margins: nil,
    orientation: nil,
    paddings: nil,
    restrictParentScroll: nil,
    rowSpan: nil,
    scrollMode: nil,
    scrollbar: nil,
    selectedActions: nil,
    tooltips: nil,
    transform: nil,
    transitionChange: nil,
    transitionIn: nil,
    transitionOut: nil,
    transitionTriggers: nil,
    visibility: nil,
    visibilityAction: nil,
    visibilityActions: nil,
    width: nil
  ))
}

func divGrid(
  columnCount: Int,
  items: [Div]
) -> Div {
  .divGrid(DivGrid(
    accessibility: nil,
    action: nil,
    actionAnimation: nil,
    actions: nil,
    alignmentHorizontal: nil,
    alignmentVertical: nil,
    alpha: nil,
    background: nil,
    border: nil,
    columnCount: .value(columnCount),
    columnSpan: nil,
    contentAlignmentHorizontal: nil,
    contentAlignmentVertical: nil,
    disappearActions: nil,
    doubletapActions: nil,
    extensions: nil,
    focus: nil,
    height: nil,
    id: nil,
    items: items,
    longtapActions: nil,
    margins: nil,
    paddings: nil,
    rowSpan: nil,
    selectedActions: nil,
    tooltips: nil,
    transform: nil,
    transitionChange: nil,
    transitionIn: nil,
    transitionOut: nil,
    transitionTriggers: nil,
    visibility: nil,
    visibilityAction: nil,
    visibilityActions: nil,
    width: nil
  ))
}

func divPager(
  items: [Div],
  layoutMode: DivPagerLayoutMode
) -> Div {
  .divPager(DivPager(
    accessibility: nil,
    alignmentHorizontal: nil,
    alignmentVertical: nil,
    alpha: nil,
    background: nil,
    border: nil,
    columnSpan: nil,
    defaultItem: nil,
    disappearActions: nil,
    extensions: nil,
    focus: nil,
    height: nil,
    id: nil,
    infiniteScroll: nil,
    itemSpacing: nil,
    items: items,
    layoutMode: layoutMode,
    margins: nil,
    orientation: nil,
    paddings: nil,
    restrictParentScroll: nil,
    rowSpan: nil,
    selectedActions: nil,
    tooltips: nil,
    transform: nil,
    transitionChange: nil,
    transitionIn: nil,
    transitionOut: nil,
    transitionTriggers: nil,
    visibility: nil,
    visibilityAction: nil,
    visibilityActions: nil,
    width: nil
  ))
}

func divState(
  divId: String,
  states: [DivState.State]
) -> Div {
  .divState(DivState(
    accessibility: nil,
    alignmentHorizontal: nil,
    alignmentVertical: nil,
    alpha: nil,
    background: nil,
    border: nil,
    columnSpan: nil,
    defaultStateId: nil,
    disappearActions: nil,
    divId: divId,
    extensions: nil,
    focus: nil,
    height: nil,
    id: nil,
    margins: nil,
    paddings: nil,
    rowSpan: nil,
    selectedActions: nil,
    stateIdVariable: nil,
    states: states,
    tooltips: nil,
    transform: nil,
    transitionAnimationSelector: nil,
    transitionChange: nil,
    transitionIn: nil,
    transitionOut: nil,
    transitionTriggers: nil,
    visibility: nil,
    visibilityAction: nil,
    visibilityActions: nil,
    width: nil
  ))
}

func divStateState(
  div: Div?,
  stateId: String
) -> DivState.State {
  DivState.State(
    animationIn: nil,
    animationOut: nil,
    div: div,
    stateId: stateId,
    swipeOutActions: nil
  )
}

func divTabs(
  items: [DivTabs.Item]
) -> Div {
  .divTabs(DivTabs(
    accessibility: nil,
    alignmentHorizontal: nil,
    alignmentVertical: nil,
    alpha: nil,
    background: nil,
    border: nil,
    columnSpan: nil,
    disappearActions: nil,
    dynamicHeight: nil,
    extensions: nil,
    focus: nil,
    hasSeparator: nil,
    height: nil,
    id: nil,
    items: items,
    margins: nil,
    paddings: nil,
    restrictParentScroll: nil,
    rowSpan: nil,
    selectedActions: nil,
    selectedTab: nil,
    separatorColor: nil,
    separatorPaddings: nil,
    switchTabsByContentSwipeEnabled: nil,
    tabTitleStyle: nil,
    titlePaddings: nil,
    tooltips: nil,
    transform: nil,
    transitionChange: nil,
    transitionIn: nil,
    transitionOut: nil,
    transitionTriggers: nil,
    visibility: nil,
    visibilityAction: nil,
    visibilityActions: nil,
    width: nil
  ))
}

func divTabsItem(
  div: Div,
  title: String
) -> DivTabs.Item {
  DivTabs.Item(
    div: div,
    title: .value(title),
    titleClickAction: nil
  )
}

func divFixedSize(_ value: Int) -> DivSize {
  .divFixedSize(DivFixedSize(value: .value(value)))
}
