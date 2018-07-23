package com.sirolf2009.maenianum.component

import com.sirolf2009.gladiator.colloseum.trading.ColloseumBacktestResult
import javafx.scene.control.Label
import org.tbee.javafx.scene.layout.MigPane

class BacktestDetails extends MigPane {
	
	new(ColloseumBacktestResult result) {
		add(new Label("Profit"))
		add(new Label(String.valueOf(result.getProfits().sum())), "wrap")
		add(new Label("Mean Profit"))
		add(new Label(String.valueOf(result.getProfits().getMean().orElse(0))), "wrap")
		add(new Label("StdDev Profit"))
		add(new Label(String.valueOf(result.getProfits().getStdDev().orElse(0))), "wrap")
		add(new Label("Mode Profit"))
		add(new Label(String.valueOf(result.getProfits().getMode().orElse(null))), "wrap")
		add(new Label("Max Drawdown"))
		add(new Label(String.valueOf(result.getDrawdown().getMax().orElse(0))), "wrap")
		add(new Label("# Trades"))
		add(new Label(String.valueOf(result.getTrades().size())), "wrap")
		
		add(new Label("Trades"), "wrap")
		add(new PositionView() => [
			items.addAll(result.getTrades())
		], "spanx 2")
	}
	
}