package com.sirolf2009.maenianum.component

import com.sirolf2009.commonwealth.trading.backtest.IBacktestResult
import io.reactivex.Observable
import io.reactivex.schedulers.Schedulers
import java.util.Date
import javafx.application.Platform
import javafx.collections.FXCollections
import javafx.scene.chart.LineChart
import javafx.scene.chart.NumberAxis
import nl.itopia.corendon.components.DateAxis
import com.sirolf2009.commonwealth.trading.IPosition

class ProfitChart extends LineChart<Date, Number> {
	
	new(IBacktestResult result) {
		super(new DateAxis(), new NumberAxis())
		Observable.fromIterable(result.getTrades()).subscribeOn(Schedulers.computation).getProfits().doOnSuccess [
			Platform.runLater[
				ProfitChart.this.getData().add(it)
			]
		].doOnError [
			printStackTrace()
		].subscribe()
	}
	
	def static getProfits(Observable<IPosition> positions) {
		return positions.map[
			new Data<Date, Number>(getExit().getDate(), getProfit())
		].toList().map[
			new Series<Date, Number>("profit", FXCollections.observableList(it))
		]
	}
	
}