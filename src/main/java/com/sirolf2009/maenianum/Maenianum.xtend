package com.sirolf2009.maenianum;

import com.sirolf2009.gladiator.colloseum.trading.ColloseumBacktestResult
import com.sirolf2009.maenianum.component.BacktestDetails
import javafx.application.Application
import javafx.scene.Scene
import javafx.scene.layout.BorderPane
import javafx.stage.Stage

class Maenianum extends Application {
	
	static ColloseumBacktestResult backtestResult

	def static void main(String[] args) {
		launch(args)
	}
	
	def static show(ColloseumBacktestResult backtestResult) {
		Maenianum.backtestResult = backtestResult
		main(#[])
	}

	override start(Stage primaryStage) throws Exception {
		val root = new BorderPane()

		root.setCenter(new BacktestDetails(backtestResult))
		
		val scene = new Scene(root, 1200, 600)
		primaryStage.setOnCloseRequest[System.exit(0)]
		primaryStage.setScene(scene)
		primaryStage.show()
	}

}
