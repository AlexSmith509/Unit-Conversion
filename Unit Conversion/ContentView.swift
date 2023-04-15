//
//  ContentView.swift
//  Unit Conversion
//
//  Created by Alex Smith on 4/14/23.
//

import SwiftUI


struct ContentView: View {
    @State private var measurement = ""
    @State private var selectedUnit = UnitLength.millimeters
    @State private var convertedUnit = UnitLength.millimeters
    
    let unitOptions = [UnitLength.millimeters, UnitLength.centimeters, UnitLength.inches, UnitLength.feet, UnitLength.yards, UnitLength.miles, UnitLength.meters, UnitLength.kilometers]
    
    var conversionCalc: Measurement<UnitLength> {
        let inputAmount = Measurement(value: Double(measurement) ?? 0, unit: selectedUnit)
        let outpoutAmount = inputAmount.converted(to: convertedUnit)
        return outpoutAmount
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Measurement", text: $measurement)
                    Picker("Original Unit", selection: $selectedUnit) {
                        ForEach(unitOptions, id: \.self) { unitOption in
                            Text(unitOption.symbol)
                        }
                    }
                }
                Section {
                    Picker("Converted Unit", selection: $convertedUnit) {
                        ForEach(unitOptions, id: \.self) { unitOption in
                            Text(unitOption.symbol)
                        }
                    }
                }
                Section {
                    Text("Final Product : \(conversionCalc.value.formatted(.number))")
                }
            } .navigationTitle("Conversion Calculator")
        }
    }
}
struct ContentViewPreview: PreviewProvider {
    static var previews: some View {
        return ContentView()
    }
}
