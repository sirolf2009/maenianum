package com.sirolf2009.maenianum;

import com.sirolf2009.commonwealth.trading.Position
import com.sirolf2009.commonwealth.trading.Trade
import com.sirolf2009.commonwealth.trading.backtest.BacktestResult
import com.sirolf2009.commonwealth.trading.backtest.IBacktestResult
import com.sirolf2009.maenianum.component.BacktestDetails
import com.sirolf2009.maenianum.component.ProfitChart
import java.time.Duration
import javafx.application.Application
import javafx.scene.Scene
import javafx.scene.layout.BorderPane
import javafx.stage.Stage

class Maenianum extends Application {
	
	static IBacktestResult backtestResult

	def static void main(String[] args) {
		backtestResult = new BacktestResult(#[
			new Position(new Trade(System.currentTimeMillis() - Duration.ofDays(7).toMillis(), 100, 100), 0, new Trade(System.currentTimeMillis() - Duration.ofDays(6).toMillis(), 200, -100), 0, 0, 0),
			new Position(new Trade(System.currentTimeMillis() - Duration.ofDays(6).toMillis(), 100, 100), 0, new Trade(System.currentTimeMillis() - Duration.ofDays(5).toMillis(), 300, -100), 0, 0, 0),
			new Position(new Trade(System.currentTimeMillis() - Duration.ofDays(5).toMillis(), 100, 100), 0, new Trade(System.currentTimeMillis() - Duration.ofDays(4).toMillis(), 400, -100), 0, 0, 0),
			new Position(new Trade(System.currentTimeMillis() - Duration.ofDays(4).toMillis(), 100, 100), 0, new Trade(System.currentTimeMillis() - Duration.ofDays(3).toMillis(), 50, -100), 0, 0, 0),
			new Position(new Trade(System.currentTimeMillis() - Duration.ofDays(3).toMillis(), 100, 100), 0, new Trade(System.currentTimeMillis() - Duration.ofDays(2).toMillis(), 100, -100), 0, 0, 0),
			new Position(new Trade(System.currentTimeMillis() - Duration.ofDays(2).toMillis(), 100, 100), 0, new Trade(System.currentTimeMillis() - Duration.ofDays(1).toMillis(), 200, -100), 0, 0, 0),
			new Position(new Trade(System.currentTimeMillis() - Duration.ofDays(1).toMillis(), 100, 100), 0, new Trade(System.currentTimeMillis() - Duration.ofDays(0).toMillis(), 200, -100), 0, 0, 0)
		])
		launch(args)
	}
	
	def static show(IBacktestResult backtestResult) {
		Maenianum.backtestResult = backtestResult
		main(#[])
	}

	override start(Stage primaryStage) throws Exception {
		val root = new BorderPane()

		root.setLeft(new BacktestDetails(backtestResult))
		root.setCenter(new ProfitChart(backtestResult))
		
		val scene = new Scene(root, 1200, 600)
		primaryStage.setOnCloseRequest[System.exit(0)]
		primaryStage.setScene(scene)
		primaryStage.show()
	}

}
