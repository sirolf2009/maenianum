package com.sirolf2009.maenianum.component

import com.sirolf2009.gladiator.colloseum.trading.ClosedPosition
import java.util.function.Function
import javafx.scene.control.TableCell
import javafx.scene.control.TableColumn
import javafx.scene.control.TableView
import javafx.util.Callback
import javafx.scene.control.TableColumn.CellDataFeatures
import javafx.beans.value.ObservableValue
import javafx.beans.property.SimpleStringProperty
import com.sirolf2009.util.TimeUtil
import java.util.Date

class PositionView extends TableView<ClosedPosition> {
	
	new() {
		getColumns().add(new TableColumn<ClosedPosition, String>("Position Type") => [
			setCellValueFactory(factory [positionType.toString()])
		])
		getColumns().add(new TableColumn<ClosedPosition, String>("Open Date") => [
			setCellValueFactory(factory [TimeUtil.format(getEntry().getDate())])
		])
		getColumns().add(new TableColumn<ClosedPosition, String>("Close Date") => [
			setCellValueFactory(factory [TimeUtil.format(getExit().getDate())])
		])
		getColumns().add(new TableColumn<ClosedPosition, String>("Size") => [
			setCellValueFactory(factory [entry.getAmount().toString()])
		])
		getColumns().add(new TableColumn<ClosedPosition, String>("Entry Price") => [
			setCellValueFactory(factory [entry.getPrice().toString()])
		])
		getColumns().add(new TableColumn<ClosedPosition, String>("Exit Price") => [
			setCellValueFactory(factory [exit.getPrice().toString()])
		])
		getColumns().add(new TableColumn<ClosedPosition, String>("Profit") => [
			setCellValueFactory(factory [it.getProfit().toString()])
		])
		getColumns().add(new TableColumn<ClosedPosition, String>("Profit %") => [
			setCellValueFactory(factory [it.getProfitPercentage().toString()])
		])
		getColumns().add(new TableColumn<ClosedPosition, String>("Fees") => [
			setCellValueFactory(factory [it.getFees().toString()])
		])
		getColumns().add(new TableColumn<ClosedPosition, String>("Max Drawdown") => [
			setCellValueFactory(factory [it.getMaxDrawdown().toString()])
		])
	}
	
	def private static Callback<CellDataFeatures<ClosedPosition, String>, ObservableValue<String>> factory(Function<ClosedPosition, String> mapper) {
		return [
//				if(getValue() !== null) {
					return new SimpleStringProperty(mapper.apply(getValue()))
//				} else {
//					return new SimpleStringProperty(mapper.apply(getValue()))
//				}
			]
	}
	
}