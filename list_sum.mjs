//const alist = process.argv[2]

const blist = [5,2,5,7,20]

function list_sum(num){
	var result = 0;
	for (const i in num){
		result = result + num[i];
	}
	

	//result = result + num;
	//console.log(result)
	return result;
}

const el_total = list_sum(blist)
console.log(el_total)

//const el_total = list_sum(alist)
//console.log(el_total)