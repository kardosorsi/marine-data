# the styles used in the app
css <- "

.app-container {
  width: 1210px;
  border-radius: 7px;
  box-shadow: rgba(0, 0, 0, 0.16) 0px 10px 36px 0px, rgba(0, 0, 0, 0.06) 0px 0px 0px 1px;
  background-color: rgb(248, 248, 248);
  margin: 12px auto;
  color: rgb(75, 86, 96);
  font-family: 'Cambria',sans-serif;
}

.header {
  padding: 32px;
  display: flex;
  flex-direction: row;
}

.title-wrapper {
  display: flex;
  flex-direction: column;
  padding-top: 10px;
}

.subtitle {
  margin-top: -12px;
  color: gray;
}

.input-wrapper {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  width: 720px;
  margin-left: auto;
}

.detail-wrapper {
  display: flex;
  flex-direction: row;
  margin: 32px;
  justify-content: space-between;
}

.detail-element {
  width: 260px;
  height: 120px;
  box-shadow: rgba(99, 99, 99, 0.2) 0px 2px 8px 0px;
  padding: 32px;
  line-height: 32px;
}

.legend-container {
  position: relative;
  z-index: 9;
  margin-bottom: -36px;
  padding: 8px;
  width: 130px;
  background: rgba(255, 255, 255, 0.5);
  margin-left: auto;
  display: flex;
  flex-direction: row;
  font-size: 14px;
  align-items: center;
  border-bottom-left-radius: 10px;
}

.legend-indicator-start {
  width: 12px;
  height: 12px;
  border-radius: 6px;
  background-color: purple;
  margin: -2px 5px 1px
}

.legend-indicator-end {
  width: 12px;
  height: 12px;
  border-radius: 6px;
  background-color: orange;
  margin: -2px 5px 0 15px;
}

.made {
  text-align: center;
  padding: 12px;
  font-size: 11px;
  color: gray;
}

"