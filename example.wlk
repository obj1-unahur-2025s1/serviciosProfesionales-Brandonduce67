class ProfesionalVinculado {
  var property universidad 
  const property honorarioPorHora = universidad.honorarioPorHora()
  const property provincias = [universidad.provincias()] 
}

class ProfesionalLitoral {
  var property universidad   
  const property provincias = ["Entre rios","Santa fe","Corrientes"]
  const property honorarioPorHora = 3000
}

class ProfesionalLibre {
  var property universidad
  var property provincias 
  var property honorarioPorHora   
}

class Universidad {
  var property provincias
  var property honorarioPorHora  
}

class Empresa {
  const property profesionalesContratados = []
  var property honorarioReferencia  

  method contratarProfesional(unProfesional) {
    profesionalesContratados.add(unProfesional)
  } 
  method cuantosEstudiaronEn(unaUniversidad) = profesionalesContratados.filter({profesional => profesional.universidad() == unaUniversidad}).size()
  method profesionalesCaros() = profesionalesContratados.filter({profesional => profesional.honorarioPorHora() > honorarioReferencia})
  method universidadesFormadoras() = profesionalesContratados.map({profesional => profesional.universidad()}).asSet()
  method profesionalBarato() = profesionalesContratados.min({profesional => profesional.honorarioPorHora()})  
  method genteAcotada() = profesionalesContratados.all({profesional => profesional.provincias() <= 3}) 


}
