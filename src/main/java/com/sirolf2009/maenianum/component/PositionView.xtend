package com.sirolf2009.maenianum.component

import com.sirolf2009.commonwealth.trading.IPosition
import com.sirolf2009.util.TimeUtil
import java.util.function.Function
import javafx.beans.property.SimpleStringProperty
import javafx.beans.value.ObservableValue
import javafx.scene.control.TableColumn
import javafx.scene.control.TableColumn.CellDataFeatures
import javafx.scene.control.TableView
import javafx.util.Callback

class PositionView extends TableView<IPosition> {

	new() {
		getColumns().add(new TableColumn<IPosition, String>("Position Type") => [
			setCellValueFactory(factory [positionType])
		])
		getColumns().add(new TableColumn<IPosition, String>("Open Date") => [
			setCellValueFactory(factory [TimeUtil.format(getEntry().getDate())])
		])
		getColumns().add(new TableColumn<IPosition, String>("Close Date") => [
			setCellValueFactory(factory [TimeUtil.format(getExit().getDate())])
		])
		getColumns().add(new TableColumn<IPosition, String>("Size") => [
			setCellValueFactory(factory [entry.getAmount()])
		])
		getColumns().add(new TableColumn<IPosition, String>("Entry Price") => [
			setCellValueFactory(factory [entry.getPrice()])
		])
		getColumns().add(new TableColumn<IPosition, String>("Exit Price") => [
			setCellValueFactory(factory [exit.getPrice()])
		])
		getColumns().add(new TableColumn<IPosition, String>("Profit") => [
			setCellValueFactory(factory [getProfit()])
		])
		getColumns().add(new TableColumn<IPosition, String>("Profit %") => [
			setCellValueFactory(factory [getProfitPercentage()])
		])
		getColumns().add(new TableColumn<IPosition, String>("Fees") => [
			setCellValueFactory(factory [getFees()])
		])
		getColumns().add(new TableColumn<IPosition, String>("Max Drawdown") => [
			setCellValueFactory(factory [getMaxDrawdown()])
		])
	}

	def private static Callback<CellDataFeatures<IPosition, String>, ObservableValue<String>> factory(Function<IPosition, Object> mapper) {
		return [
			return new SimpleStringProperty(String.valueOf(mapper.apply(getValue())))
		]
	}

}
